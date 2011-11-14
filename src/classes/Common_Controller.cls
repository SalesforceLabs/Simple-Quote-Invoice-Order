public with sharing class Common_Controller{
    public String japaneseFontStyle {get; set;}
    public Common_Controller(ApexPages.StandardController controller) {
        this.japaneseFontStyle = '';
        if (UserInfo.getLanguage() == 'ja') {
            this.japaneseFontStyle = '<style type="text/css">body, table, th, td{font-family: Arial Unicode MS;}</style>';
        }
    }
}