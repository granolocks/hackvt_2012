var GameView = Backbone.View.extend({
	className: "game-view",

	initialize: function () {
		console.log('GameView - initialize()');
		console.log('GameView - Game Model...');
		console.log(this.model.toJSON());

		this.model.bind('change', this.render, this);
    },

    render: function() {
    	console.log('GameView - render()');

    	$(this.el).html(ich.Game(this.model.toJSON()));

        return this;
    },
});	