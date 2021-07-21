package assessment

class User {
    String email
    String username
    String password
    String firstName
    String lastName
    byte[] photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    static hasMany = [subscriptions:Subscription,topics:Topic,readingitems:ReadingItem,resources:Resource,resourceratings:ResourceRating]
    static constraints = {
    }
    static mapping = {
        table 'global_user'
    }
}
