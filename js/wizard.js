var WizardDemo = function () {
    $("#m_wizard");
    var e, r, i = $("#m_form");
    return {
        init: function () {
            var n;
            $("#m_wizard"), i = $("#m_form"), (r = new mWizard("m_wizard", {
                startStep: 1
            })).on("beforeNext", function (r) {
                //!0 !== e.form() && r.stop()
            }), r.on("change", function (e) {
                mApp.scrollTop()
            })
        }
    }
}();
jQuery(document).ready(function () {
    WizardDemo.init()
});