package assessment

class Subscription {
    Seriousness seriousness
    Date dateCreated
    enum Seriousness {
        Serious, VerySerious, Casual
        def convert(int value){
            if(value==0){return Serious}
            else if(value==1){return VerySerious}
            else if(value==2){return Casual}
            else {return false}
        }

    }
    static belongsTo = [topic:Topic, user:User]
    static constraints = {
        seriousness nullable: true
    }
}
