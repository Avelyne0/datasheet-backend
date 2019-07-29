class ApplicationController < ActionController::API
    before_action :set_current_user
    before_action :authorize, except: [:everything]

    def everything
        render json: { 
            abilities: Ability.all, 
            faction_keywords: FactionKeyword.all, 
            keywords: Keyword.all, 
            models: Model.all,  
            units: Unit.all,
            wargear_options: WargearOption.all,
            weapons: Weapon.all
        }
    end

    def issue_token(payload)
        JWT.encode(payload, ENV['RAILS_SECRET'])
    end

    def decode_token(token)
        JWT.decode(token, ENV['RAILS_SECRET'])[0]
    end

    def get_token
        request.headers["Authorization"] || request.headers["Authorisation"]
    end

    def set_current_user
        token = get_token
        if token
            decoded_token = decode_token(token)
            @current_user = User.find(decoded_token["user_id"])
        else 
            @current_user = nil
        end
    end

    def logged_in
        !!@current_user
    end

    def authorize
        if !logged_in
            return render json: { error: 'you must be logged in'}, status: :unauthorized
        end
    end
end