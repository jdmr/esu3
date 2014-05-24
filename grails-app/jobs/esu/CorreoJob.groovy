package esu


class CorreoJob {
    static triggers = {
        cron name: 'enviaCorreos', cronExpression: "0 0 12 * * SAT"
//        simple repeatInterval: 5000l // execute job once in 5 seconds
    }

    def execute() {
        // execute job
    }
}
