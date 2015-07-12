class WelcomeController < ActionController::Base
  def index
    @data = {
      :hack_name => 'Mecenate',
      :hack_description => "Italy has a great number of wonderful monuments and artworks. Keep them beautiful as they are is expensive. As tourists we can be more responsible and contribute to keep them alive. Mecenate lets you donate to keep them up!",
      :hack_autors => [
        {:name => 'Alessandro Calzavara', :twitter => '@DrAl3x'},
        {:name => 'Matteo Centenaro', :twitter => '@bugant'},
        {:name => 'Niccolo Paravanti', :twitter => '@niqdev'}
      ],
      :technologies => ['Android', 'Ruby', 'Ruby on Rails', 'JavaScript', 'AngularJS'],
      :partner_technlogies => %w{Braintree Heroku Sendgrid}
    }

    respond_to do |format|
      format.html
      format.json { render :json => @data }
    end
  end
end
