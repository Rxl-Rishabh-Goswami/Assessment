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
    }
}
