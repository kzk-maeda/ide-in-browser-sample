<template>
    <div id="ace-edit"></div>
</template>
<style>
#ace-edit {
    height: 400px;
    margin-top: 10px;
    margin-left: 10px;
    margin-right: 10px;
}
</style>
<script>
    export default {
        beforeCreate() {
            // var aceScript = document.createElement('script')
            // aceScript.setAttribute('src', 'https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/ace.js')
            // document.body.appendChild(aceScript)

            // var modeScript = document.createElement('script')
            // modeScript.setAttribute('src', 'https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/mode-javascript.js')
            // document.body.appendChild(modeScript)

            // var themeScript = document.createElement('script')
            // themeScript.setAttribute('src', 'https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.12/theme-twilight.js')
            // document.body.appendChild(themeScript)
            
        },
        mounted() {
            var ace = window.ace
            
            var editor = ace.edit("ace-edit");
            editor.getSession().setMode("ace/mode/javascript");
            editor.setTheme("ace/theme/twilight");
            
        },
    }
</script>