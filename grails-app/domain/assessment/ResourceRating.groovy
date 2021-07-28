package assessment

class ResourceRating {
    int score
    static belongsTo = [user:User,resource:Resource]
    static constraints = {
        score nullable:true
    }
}
