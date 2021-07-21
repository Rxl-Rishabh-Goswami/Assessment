package assessment

class Resource {
    String description
    Date dateCreated
    Date lastUpdated
    static hasMany = [readingitems:ReadingItem,resourceratings:ResourceRating]
    static belongsTo = [topic:Topic,user:User]
    static constraints = {
    }
    static mapping = {
        table 'global_resource'
    }
}
