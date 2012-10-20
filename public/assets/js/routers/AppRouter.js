var AppRouter = Backbone.Router.extend({
 
    routes:{
        ""                      : "game",
    },

    game: function() {
    	console.log('AppRouter - game()');
		
		this.controller = new GameController();
    },
});