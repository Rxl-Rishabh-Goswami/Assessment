package assessment

class ResourceRatingController {

    def index() { }
    def rating(){
        User user = User.findWhere(username: session.username)
        def resourceID = params.resourceID as Long
        Resource resource = Resource.findWhere(id:resourceID)
        ResourceRating rate = new ResourceRating()
        def rateScore = params.r as int
        rate.score = rateScore
        user.addToResourceratings(rate)
        resource.addToResourceratings(rate)
        println rate.score
        rate.save(flush:true,failOnError:true)
    }
}
