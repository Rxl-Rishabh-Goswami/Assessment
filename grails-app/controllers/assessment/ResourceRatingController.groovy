package assessment

class ResourceRatingController {

    def index() { }
    def rating(){
        User user = User.findWhere(username: session.username)
        def resourceID = params.resourceID as Long
        Resource resource = Resource.findWhere(id:resourceID)
        ResourceRating rate = new ResourceRating()
        rate.score = params.r
        user.addToResourceratings(rate)
        resource.addToResourceratings(rate)
        println rate.score
        rate.save(flush:true,failOnError:true)
    }
}
