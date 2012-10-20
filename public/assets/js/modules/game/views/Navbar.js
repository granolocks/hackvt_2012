var NavbarView = Backbone.View.extend({
	className: "navbar-view",

	initialize: function () {
		console.log('NavbarView - initialize()');
		console.log('NavbarView - Game Model...');
		console.log(this.model.toJSON());

		this.model.bind('change', this.render, this);
    },

    render: function() {
    	console.log('NavbarView - render()');

    	$(this.el).html(ich.Navbar(this.model.toJSON()));

        return this;
    },
});	