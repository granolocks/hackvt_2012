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

    loadModels: function() {
        console.log('Game Model - loadModels()');

        stop = new Stop();
        stop.set('id', this.get('stop')['id']);
        stop.set('name', this.get('stop')['name']);
        stop.set('description', this.get('stop')['description']);
        this.set('stop', stop);

        solution1 = new Solution();
        solutions_array = this.get('solutions');
        solution1.set('id', solutions_array[0]['id']);
        solution1.set('item_type', solutions_array[0]['required_item_type_id']);
        solution1.set('stop_id', solutions_array[0]['stop_id']);
        solution1.set('description', solutions_array[0]['description']);
        
        solution2 = new Solution();
        solutions_array = this.get('solutions');
        solution2.set('id', solutions_array[1]['id']);
        solution2.set('item_type', solutions_array[1]['required_item_type_id']);
        solution2.set('stop_id', solutions_array[1]['stop_id']);
        solution2.set('description', solutions_array[1]['description']);

        solutions = new SolutionCollection();
        solutions.add(solution1);
        solutions.add(solution2);
        this.set('solutions', solutions);

        inventoryCollection = new InventoryItemCollection();
        inventoryCollection.add({ 'id': 'food', 'count' : this.get('inventory')['food'] });
        inventoryCollection.add({ 'id': 'weapon', 'count' : this.get('inventory')['weapon'] });
        inventoryCollection.add({ 'id': 'tool', 'count' : this.get('inventory')['tool'] });
        inventoryCollection.add({ 'id': 'tent', 'count' : this.get('inventory')['tent'] });
        inventoryCollection.add({ 'id': 'towel', 'count' : this.get('inventory')['towel'] });
        this.set('inventoryItems', inventoryCollection);

        activities_array = this.get('activities');
        activitiesCollection = new ActivityCollection();
        for(i = 0; i < activities_array.length; i++) {
            activity = new Activity();
            activity.set('activity_type_id', activities_array[i]['activity_type_id']);
            activity.set('address', activities_array[i]['address']);
            activity.set('description', activities_array[i]['description']);
            activity.set('id', activities_array[i]['id']);
            activity.set('latitude', activities_array[i]['latitude']);
            activity.set('longitude', activities_array[i]['longitude']);
            activity.set('name', activities_array[i]['name']);
            activity.set('website', activities_array[i]['website']);
            activitiesCollection.add(activity);
        }

        this.set('activities', activitiesCollection);
    },

    initialize: function () {
        _(this).bindAll('loadStub');
        console.log('Game Model - initialize()');
    },
})