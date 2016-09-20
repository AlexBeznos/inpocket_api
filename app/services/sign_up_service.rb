class SignUpService
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :provider, :attributes, :current_user,
                :user_params, :profile_params, :profile_class

  validates :provider, presence: true
  validates :provider, inclusion: { in: ['email', 'facebook', 'vk'] }

  def initialize(attributes = {})
    @attributes = attributes
    @provider = @attributes[:provider]
  end

  def save
    return false unless self.valid?
    prepare_params

    ActiveRecord::Base.transaction do
      user_update
      profile_create unless provider == 'email'
    end

    !self.errors.any?
  end

  def persisted?
    false
  end

  private

  def prepare_params
    prepare_user_params
    prepare_profile_params if provider && provider != 'email'
  end

  def prepare_user_params
    @user_params = attributes.select {|k,v| User.attribute_names.include?(k.to_s)}
    @user_params[:signed] = true
  end

  def prepare_profile_params
    @profile_class = "#{provider}_profile".classify.constantize
    @profile_params = attributes.select do |k, v|
      profile_class.attribute_names.include? k.to_s
    end
    @profile_params[:user_id] = current_user.id
  end

  def user_update
    current_user.update(user_params)

    if current_user.errors.any?
      self.errors.add(:user, current_user.errors)
    end
  end

  def profile_create
    profile = profile_class.new(profile_params)
    profile.save

    if profile.errors.any?
      self.errors.add(profile_class.to_s.underscore, profile.errors)
    end
  end
end
