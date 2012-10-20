# mainly for testing purposes
def get_or_put(path, opts={}, &block)
    get(path, opts, &block)
    put(path, opts, &block)
end

class Wintermute < Sinatra::Base
  namespace "/api" do

    # We are going to return json for everything in this area.
    before do
      content_type "application/json"
      response['Access-Control-Allow-Origin'] = "*"
    end

    namespace "/v1" do

      # Return the Entire Game Model
      get '/game/?' do
        #login_required
        current_user = User.get(1)

        JSON.pretty_generate(game_state)
      end

      # Tell the backend user has consumed an inventory item to advance
      # Returns updated game state model
      get_or_put '/inventory/:inventory_type/?' do
        #login_required
        current_user = User.get(1)

        current_user.complete_stop!(params[:inventory_type])

        # Return Game State
        JSON.pretty_generate(game_state)
      end

      # Tell the backend that the user has taken an action on the given acitvity
      # Possible actions include ‘complete’ or ‘reject’
      # Returns an updated game state model
      namespace '/activity' do

        # Mark activity as unwanted
        post '/reject/:activity_id/?' do
          #login_required
          current_user = User.get(1)

          current_user.dislike_activity(params[:activity_id])

          # Return Game State
          JSON.pretty_generate(game_state)
        end

        # Mark activity as complete
        # Increment inventory
        post '/complete/:activity_id/?' do
          #login_required
          current_user = User.get(1)

          # complete the activity
          current_user.complete_activity(params[:activity_id])

          # Return Game State
          JSON.pretty_generate(game_state)
        end

      end

      private
      def game_state

        current_user = User.get(1)
        solutions = current_user.current_stop.solutions.map(&:attributes)
        solutions = solutions.map do |s|
          s[:required_item_type_id] = ItemType.get(s[:required_item_type_id]).name
          s
        end
        {
          stop: current_user.current_stop.attributes,
          solutions: solutions,
          inventory: current_user.inventory_counts,
          activities: current_user.suggestions.map(&:attributes)
        }
      end

    end
  end
end

