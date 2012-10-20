var Game = Backbone.Model.extend({
	url: function() { return $app.base+'game'; },

    loadStub: function() {
        console.log('Game Model - loadStub()');

        //Stop
        var stop = new Stop();
        this.set('stop', stop);

        //SOLUTIONS
        var solution1 = new Solution();
        var solution2 = new Solution();
        solution2.set('id', 2);
        solution2.set('description', 'You can run the fuck away.');
        var solutions = new SolutionCollection();
        solutions.add(solution1);
        solutions.add(solution2);
        this.set('solutions', solutions);

        //INVENTORYITEMS
        var inventoryItem1 = new InventoryItem();
        var inventoryItem2 = new InventoryItem();
        var inventoryItem3 = new InventoryItem();
        var inventoryItem4 = new InventoryItem();
        var inventoryItem5 = new InventoryItem();
        inventoryItem2.set('id', 'weapon');
        inventoryItem3.set('id', 'towel');
        inventoryItem4.set('id', 'tent');
        inventoryItem5.set('id', 'tool');
        var inventoryItems = new InventoryItemCollection();
        inventoryItems.add(inventoryItem1);
        inventoryItems.add(inventoryItem2);
        inventoryItems.add(inventoryItem3);
        inventoryItems.add(inventoryItem4);
        inventoryItems.add(inventoryItem5);
        this.set('inventoryItems', inventoryItems);

        //ACTIVITIES
        var activity1 = new Activity();
        var activity2 = new Activity();
        activity2.set('id', 2);
        var activities = new ActivityCollection();
        activities.add(activity1);
        activities.add(activity2);
        this.set('activities', activities);
    },

    initialize: function () {
        _(this).bindAll('loadStub');
        console.log('Game Model - initialize()');

        this.set("stop")
    },
})