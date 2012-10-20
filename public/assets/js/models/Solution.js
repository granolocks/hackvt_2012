var Solution = Backbone.Model.extend({
	defaults: {
		'id': 1,
		'description': 'You can fight the bear.',
		'required_item': 'weapon'
    },

    initialize: function () {
    } 
})

var SolutionCollection = Backbone.Collection.extend({
    model: Solution,

    initialize: function() {
    },
});