package assessment

import grails.gorm.transactions.Transactional

@Transactional
class SearchService {

    def serviceMethod() {

    }
    List topic = Topic.findAllByVisibility(0)
    List searchPost(String key){
       String searchKey = '%'+key+'%'
        List searchPost = Resource.createCriteria().list(){
            or{
                ilike('description',searchKey)
                ilike('it.topic.name',searchKey)
            }

        }
        return searchPost
    }
}
