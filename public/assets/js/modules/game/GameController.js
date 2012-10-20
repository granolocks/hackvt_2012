var GameController = Backbone.View.extend({
	
	initialize: function () {
		console.log('GameController - initialize()');

		_.bindAll(this, 'loadStub', 'loadGameView', 'loadModels');

		this.game = new Game();
        this.game.fetch({success: this.loadModels });
    },

    events: {
        //"click .save-options"       : "updateQuiz",
    },

    render: function() {
    	console.log('GameView - render()');

        return this;
    },

    loadStub: function() {
    	console.log('GameController - loadStub()');

    	this.game.loadStub();
    	this.loadGameView();
    },

    loadModels: function () {
        console.log('GameController - loadModels()');

        console.log(this.game.toJSON());

        this.game.loadModels();

        this.loadGameView();
    },

    loadGameView: function() {
        console.log('GameController - loadGameView()');
        this.stop = this.game.get('stop');
        solutions = this.game.get("solutions");
        this.solution1 = solutions.at(0)
        this.solution2 = solutions.at(1);
        this.inventoryItems = this.game.get('inventoryItems');
        this.activities = this.game.get('activities');

        this.gameView = new GameView({model: this.game}); //may not need game model here
        this.navbarView = new NavbarView({model: this.game});
        this.mapView = new MapView({model: this.game});
        this.sidebarStopView = new SidebarStopView({model: this.stop});
        this.sidebarSolutionView1 = new SidebarSolutionView({model: this.solution1})
        this.sidebarSolutionView2 = new SidebarSolutionView({model: this.solution2})
        
        $('body').prepend(this.gameView.render().el);
        $('.navbar-inner').html(this.navbarView.render().el);
        $('.hero-unit').html(this.mapView.render().el);
        //$('.sidebar-well').html(this.sidebarWellView.render().el);
        $('.sidebar-container').append(this.sidebarStopView.render().el);
        $('.sidebar-container').append(ich.SidebarOptions());
        $('.sidebar-options-list').append(this.sidebarSolutionView1.render().el);
        $('.sidebar-options-list').append(this.sidebarSolutionView2.render().el);
        $('.sidebar-container').append(ich.Inventory());

        this.inventoryItems.each(function(item) {
            inventoryItemView = new InventoryItemView({model: item});
            $('.inventory-items').append(inventoryItemView.render().el);
        })

        $('.sidebar-container').append(ich.Activities());
        $('#activities-accordion').append()
        this.activities.each(function(activity) {
            activityView = new ActivityView({model: activity});
            $('#activities-accordion').append(activityView.render().el);
        })
    }
});	