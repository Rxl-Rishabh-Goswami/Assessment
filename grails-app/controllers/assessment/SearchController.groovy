package assessment

class SearchController {
//    SearchService searchService
PostService postService

    def searchPage(){
        User user = User.findWhere(username: session.username)
        List recent = postService.recent()
        List trend = postService.trend()


        String searchKey = params.searchKey
        String key = '%'+searchKey+'%'

        List searchTopic = Topic.createCriteria().list(){
            ilike('name',key)
        }
        List searchPost
        if(searchTopic){
             searchPost = Resource.createCriteria().list() {
                or{
                    ilike('description',key)
                    inList('topic',searchTopic)
                }
            }
        }
        else {
             searchPost = Resource.createCriteria().list() {
                or{
                    ilike('description',key)
                    //inList('topic',searchTopic)
                }
            }
        }
        println searchTopic

        render(view: 'Search',model: [user:user,searchPost:searchPost,searchKey: searchKey,recent:recent,topic:trend])


    }
}
