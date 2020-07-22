<template>
    <p>editor</p>
    <div id="editor"></div>
</template>
<style>
    #editor {
        height: 600px;
    }
</style>
<script>
    import ace from 'ace.js'
    export default {
        data() {
            return {
                editor: null
            }
        },
        created() {
            this.editor = ace.edit("editor");
            this.editor.setTheme("ace/theme/monokai");
            this.editor.session.setMode("ace/mode/javascript");
        },
    }
</script>