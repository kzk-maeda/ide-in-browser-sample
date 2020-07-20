<template>
  <div id="terminal">
  </div>
</template>
<script>
    import { Terminal } from 'xterm';
    
    export default {
        mounted: function() {
            this.openTerms();
        },
        methods: {
            openTerms: function() {
                var term = new Terminal();
                let prompt = "xterm.js"
                let cursor = 0;
                let current_line = "";
                term.open(document.getElementById('terminal'));
                term.write('\x1B[1;3;31m' + prompt + '\x1B[0m $ ')
                term.onKey((data) => {
                    console.log('Current Line : ' + current_line)
                    switch(data.domEvent.key) {
                        case "Enter":
                            term.write('\r\n');
                            term.write('\x1B[1;3;31m' + prompt + '\x1B[0m $ ');
                            cursor = 0;
                            current_line = "";
                            break;
                        case "ArrowUp":
                        case "ArrowDown":
                            break;
                        case "ArrowLeft":
                            if(cursor > 0) {
                                cursor -= 1;
                                term.write(data.key);
                            }
                            break;
                        case "ArrowRight":
                            if(cursor >= 0 && cursor < current_line.length) {
                                cursor += 1;
                                term.write(data.key);
                            }
                            break;
                        case "Backspace":
                            if(cursor > 0) {
                                cursor -= 1;
                                current_line = current_line.slice(0, -1);
                                term.write('\b \b');
                            }
                            break;
                        default:
                            if(cursor < 120) {
                                cursor += 1;
                                current_line += data.key;
                                term.write(data.key)
                            }
                    }
                })
            }
        },
    }
</script>