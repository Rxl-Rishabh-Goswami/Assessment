package assessment

class Subscription {
    Seriousness seriousness
    Date dateCreated
    enum Seriousness {Serious, VerySerious, Casual}
    static belongsTo = [topic:Topic, user:User]
    static constraints = {
        seriousness nullable: true
    }
}
