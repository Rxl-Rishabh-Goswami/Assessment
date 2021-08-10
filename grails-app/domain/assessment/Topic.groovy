package assessment

class Topic {
    String name
    Date dateCreated
    Date lastUpdated
    enum Visibility {
        Public , Private
        def convert(int value){
            if(value==0){return Visibility.Public}
            else{return Visibility.Private}
        }
    }

    Visibility visibility



    static hasMany = [resources:Resource,subscriptions:Subscription]
    static belongsTo = [user:User]
    static constraints = {
        name unique:true,nullable: false,blank: false
        visibility(nullable: true)
    }
}
