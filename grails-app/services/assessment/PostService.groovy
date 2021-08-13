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
        def topList = new ArrayList()
        for (int i = 0; i < top.size() ; i++) {
            topList[i] = top[i][1]
        }


        return topList
    }
    def trend(){
        List publicTopic = Topic.findAllByVisibility(0)
        List trend = Resource.createCriteria().list(max: 5,offset: 0) {
            projections {
                count("id", 'numResource')
            }
            inList('topic',publicTopic)
            groupProperty("topic")
            order('numResource', 'desc')
        }

        def trendList = new ArrayList()
        for (int i=0;i<trend.size();i++){
            trendList[i] = trend[i][1]
        }
        //List pub = Topic.findAllByVisibility(0)
//        Topic test = Topic.get(23)
//        Enum vis = test.visibility.convert(0)
//        List trend = Topic.createCriteria().list(max:5,offset:0,sort:"topic.resources.size",order:"desc") {
//            eq('visibility', vis)
//        }
        //List trend = Topic.list(max:5,offset:0)
//        trend.sort {
//            Topic topic -> -topic.resources.size()
//        }
        return trendList
    }

}
