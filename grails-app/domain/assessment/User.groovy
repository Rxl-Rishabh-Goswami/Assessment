package assessment

class User {
    String email
    String username
    String password
    String firstName
    String lastName
    String photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    static hasMany = [subscriptions:Subscription,topics:Topic,readingitems:ReadingItem,resources:Resource,resourceratings:ResourceRating]
    static constraints = {
        email(nullable: false,email: true,unique: true,blank: false)
        firstName(nullable: false)
        lastName(nullable: true)
        username(nullable: false, unique: true)
        password(nullable: false)
        photo(nullable: true)
        active(nullable: true)
        admin(nullable: true)
    }
    static mapping = {
        table 'global_user'
    }
}
