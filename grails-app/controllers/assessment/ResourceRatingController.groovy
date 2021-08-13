package assessment

class ResourceRatingController {
    ResourceRatingService resourceRatingService

    def rating() {
        User user = User.findWhere(username: session.username)
        def resourceID = params.resourceID as Long
        Resource resource = Resource.findWhere(id: resourceID)
        int score = params.r as int
        ResourceRating ratingAResource = resourceRatingService.rateResource(user, resource, score)
        redirect(controller: 'resources', action: 'index', params: [resourceID: resourceID])
    }
}
