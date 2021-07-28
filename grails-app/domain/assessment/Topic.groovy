package assessment

class Topic {
    String name
    Date dateCreated
    Date lastUpdated
    Visibility visibility
    enum Visibility {Public , Private}
    static hasMany = [resources:Resource,subscriptions:Subscription]
    static belongsTo = [user:User]
    static constraints = {
        name unique:true,nullable: false,blank: false
        visibility(nullable: true)
    }
}
