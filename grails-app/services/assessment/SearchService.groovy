package assessment

import grails.gorm.transactions.Transactional

@Transactional
class SearchService {

    def serviceMethod() {

    }
    List searchPost(String key){
       String searchKey = '%'+key+'%'
        List searchPost = Resource.createCriteria().list(){
            or{
                ilike('description',searchKey)
            }

        }
        return searchPost
    }
}
