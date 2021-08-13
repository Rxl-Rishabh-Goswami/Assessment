package assessment

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class AssessmentInterceptorSpec extends Specification implements InterceptorUnitTest<AssessmentInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test assessment interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"assessment")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
