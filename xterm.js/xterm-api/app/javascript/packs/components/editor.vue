<template>
    <div id="editor-area">
        <div id="ace-edit">{{ contents }}</div>
        <div id="buttons">
            <div class="btn" v-on:click="displayFinishedTasks">Save</div>
            <div class="btn" v-on:click="displayFinishedTasks">Run</div>
        </div>
    </div>
</template>
<style>
#ace-edit {
    height: 400px;
    margin-top: 10px;
    margin-left: 10px;
    margin-right: 10px;
}
#buttons {
    margin-top: 10px;
    margin-left: 10px;
    margin-right: 50px;
    text-align: left;
}
.button {
    width: 40px;
    padding: 0.3em 1em;
}
</style>
<script>
    export default {
        data() {
            return {
                editor: null,
                session: null,
                contents: "// input code here....",
            }
        },
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
            
            this.editor = ace.edit("ace-edit");
            this.editor.getSession().setMode("ace/mode/javascript");
            this.editor.setTheme("ace/theme/solarized_dark");
            this.editor.setOptions({
                vScrollBarAlwaysVisible: true,
                copyWithEmptySelection: true,
            });

            this.session = this.editor.session;
            this.edit(this.session)
        },
        updated() {
            console.log(this.session)
        },
        methods: {
            edit: function(session) {
                console.log(session.getValue)
            }
        },
    }
</script>