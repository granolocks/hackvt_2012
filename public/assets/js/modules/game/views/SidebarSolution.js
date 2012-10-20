var SidebarSolutionView = Backbone.View.extend({
	className: "SidebarSolution-view",

	initialize: function () {
		console.log('SidebarSolutionView - initialize()');
		console.log('SidebarSolutionView - Game Model...');
		console.log(this.model.toJSON());

		this.model.bind('change', this.render, this);
    },

    render: function() {
    	console.log('SidebarSolutionView - render()');

    	$(this.el).html(ich.SidebarOption(this.model.toJSON()));

        return this;
    },
});	