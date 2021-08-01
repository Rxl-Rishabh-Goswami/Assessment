package assessment

class Resource {
    String description
    Date dateCreated
    Date lastUpdated
    static hasMany = [readingitems:ReadingItem,resourceratings:ResourceRating]
    static belongsTo = [topic:Topic,user:User]
    static constraints = {
        description nullable: false, maxSize: 255
    }
    static mapping = {
        table 'global_resource'
    }
}
