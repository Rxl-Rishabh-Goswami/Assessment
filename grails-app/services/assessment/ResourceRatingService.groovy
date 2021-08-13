package assessment

import grails.gorm.transactions.Transactional

@Transactional
class ResourceRatingService {

    ResourceRating rate

    def rateResource(User user, Resource resource, int score) {
        if (ResourceRating.findByUserAndResource(user, resource)) {
            rate = ResourceRating.findByUserAndResource(user, resource)
            rate.score = score
            rate.save(flush: true, failOnError: true)
        } else {
            rate = new ResourceRating()
            rate.score = score
            user.addToResourceratings(rate)
            resource.addToResourceratings(rate)
            rate.save(flush: true, failOnError: true)
        }
        return rate

    }
}
