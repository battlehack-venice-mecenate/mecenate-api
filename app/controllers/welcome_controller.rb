class WelcomeController < ActionController::Base
  def index
    @data = {
      :hack_name => 'Mecenate',
      :hack_description => "Italy has a great number of wonderful monuments and artworks. Keep them beautiful as they are, it is an expensive task; as tourists we can get more responsible and contribute to these expenses.

      Mecenate lets you donate to keep your preferred artworks and monuments healthy. Let all people in the words be able to see historic monuments and artworks: help to keep them up!",
      :hack_autors => [
        {:name => 'Alessandro Calzavara', :twitter => '@DrAl3x'},
        {:name => 'Matteo Centenaro', :twitter => '@bugant'},
        {:name => 'Niccolo Paravanti', :twitter => '@niqdev'}
      ],
      :technologies => ['Android', 'Ruby', 'Ruby on Rails', 'JavaScript', 'AngularJS'],
      :partner_technlogies => %w{Braintree Sendgrid Heroku}
    }

    respond_to do |format|
      format.html
      format.json { render :json => @data }
    end
  end
end
