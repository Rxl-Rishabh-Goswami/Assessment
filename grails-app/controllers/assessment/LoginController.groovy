package assessment

import grails.converters.JSON

class LoginController {
    SubscribeService subscribeService
    PostService postService
    def index() {

        List recent = postService.recent()
        List top = postService.top()
        //List top = Resource.listOrderByResourceratings(max:5,offset: 0,order:"desc")
        render(view: 'index', model: [top:top,recent:recent])
    }
    def loginuser() {
        User user = User.findWhere(username: params['username'], password: params['password'],active: true)
        if(!user){
            user = User.findWhere(email: params['username'], password: params['password'])
        }
        if (user) {
            session.username = user.username
            flash.loginMessage = "Welcome ${user.firstName}!!"
            redirect(action: 'dashboard') //, model: [user:user])
        }
        else{
            flash.logoutMessage = "Username or Password Doesn't Match any Records"
            redirect(url:'http://localhost:9091/')

        }
    }

    def register(){
        if(params['password'] == params['confirm']) {



            User user = new User(email: params['email'], username: params['username'], firstName: params['firstName'], lastName: params['lastName'], password: params['password'], active: true, admin: false)
            def profilePhoto = request.getFile("profilePhoto")
            String origin = profilePhoto.getOriginalFilename()
            if (origin) {
                File file = new File("/home/rxlogix/IdeaProjects/Assessment/grails-app/assets/images/profilePicture/${params.username}.jpg")
                profilePhoto.transferTo(file)
                user.photo ="/profilePicture/${params.username}.jpg"
            }
            else{
                user.photo="/profilePicture/default/unknown.jpg"
                println params.profilePhoto
            }
            user.validate()
            if(user.hasErrors()){
                flash.registerError = "User Can't Be Registered"
                redirect(url:'http://localhost:9091/')
            }
            else {
                user.save(flush:true,failOnError:true)
                flash.message = "User Created Successully, Please Log In"
                redirect(url:'http://localhost:9091/')
            }



        }
        else{
            flash.error = "Errr...!!! Some Issue, Try Again!"
            redirect(url:'http://localhost:9091/')
        }
    }
    def forgetPassword(){
        render(view: 'forgetpassword')

    }
    def changePassword(){
        User user = User.findWhere(username: params['username'],email: params['email'])
        if(user){

            String uniqueToken = UUID.randomUUID()
            user.verificationToken = uniqueToken
            user.save(flush:true)
            sendMail{
                        to user.email
                        subject 'Update your password'
                        body 'Click On The Link To Change Password : http://localhost:9091/login/emailPassword?token='+ uniqueToken
                    }
            flash.emailChangePassword="Verification Link Sent On Email, Please Check"
            redirect(url:'http://localhost:9091/')






            //render(view: 'changepassword',model: [userEmail:user.email])


        }
        else{
            flash.messsage = "User Not Found"
            redirect(action: 'forgetPassword')
        }



    }

    def emailPassword(String token){
        User user = User.findByVerificationToken(token)
        render(view: 'changepassword', model: [user:user])
    }



    def updatePassword(){
        if(params.newpassword==params.confirmpassword){
            User user = User.findByEmail(params.email)
            user.password = params.newpassword
            user.verificationToken = null
            user.save(flush:true, failOnError:true)
            flash.changePassword = "Password Changed"
            redirect(url:'http://localhost:9091/')
        }
        else{
            flash.errorChangePassword = "Errr...!!! Try Again, Credentials Don't Match"
            redirect(url:'http://localhost:9091/')
        }


    }
    def logout(){
        session.invalidate()
        flash.logOut = "You've Been Logged Out, See You Soon !!!"
        redirect(url:'http://localhost:9091/')
    }
    def dashboard(){
        User user = User.findWhere(username: session.username)
//        List topic = Topic.list()
        List trend = postService.trend()
//        List resource = Resource.list()
        List resource = subscribeService.inboxResource(user)
//        List subscribe = Subscription.findAllByUser(user)
        List subscribe = subscribeService.subscribeTopics(user)
        render(view: 'dashboard', model:[user:user,topic:trend,resource:resource,subscribe:subscribe])
    }


}




