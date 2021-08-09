package assessment

import grails.gorm.transactions.Transactional

@Transactional
class PostService {

    def serviceMethod() {

    }
    def recent(){
        List publicTopic = Topic.findAllByVisibility(0)
        List recent = Resource.createCriteria().list(max:5,offset:0){
            inList("topic",publicTopic)
            order("dateCreated","desc")
        }
        return recent
    }
    def top(){
        List publicTopic = Topic.findAllByVisibility(0)
        List resource = Resource.createCriteria().list(){
            inList("topic",publicTopic)
        }
        List<Resource> top = ResourceRating.createCriteria().list() {
            projections {
                avg("score", "average")
            }
            inList("resource", resource)
            order("average", "desc")
            groupProperty("resource")
        }
        return top
    }
    def trend(){

//        List trend = Resource.createCriteria().list(max: 5,offset: 0) {
//            projections {
//                count("id", 'numResource')
//            }
//            groupProperty("topic")
//            order('numResource', 'desc')
//        }
        List trend = Topic.list()
        trend.sort {
            Topic topic -> -topic.resources.size()
        }
        return trend
    }

}
