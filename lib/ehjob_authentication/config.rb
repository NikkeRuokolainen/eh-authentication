module EhjobAuthentication
  class Config
    attr_accessor :eh_url, :job_url, :disable, :hide_social_buttons

    def hr?
      job_url.present?
    end

    def job?
      eh_url.present?
    end

    def base_url
      hr? ? job_url : eh_url
    end
  end
end
