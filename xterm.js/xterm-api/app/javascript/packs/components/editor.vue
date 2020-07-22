<template>
    <div id="editor">
        <editor v-model="content" @init="editorInit" lang="html" theme="chrome"></editor>
    </div>
</template>
<style>
#editor {
    height: 400px;
    margin-top: 10px;
    margin-left: 10px;
    margin-right: 10px;
}
</style>
<script>
    export default {
        components: {
            'editor': require('vue2-ace-editor')
        },
        methods: {
            editorInit: function () {
                require('brace/ext/language_tools') //language extension prerequsite...
                require('brace/mode/html')                
                require('brace/mode/javascript')    //language
                require('brace/mode/less')
                require('brace/theme/chrome')
                require('brace/snippets/javascript') //snippet
            }
        }
    }
</script>