<template>
  <div id="terminal">
  </div>
</template>
<script>
    import { Terminal } from 'xterm';
    
    export default {
        data: function() {
            return {
                term: null,
                terminalChannel: null,
                prompt: '\x1B[1;3;31mxterm.js\x1B[0m $ '
            }
        },
        created() {
            this.terminalChannel = this.$cable.subscriptions.create("TerminalChannel", {
                connected: () => {
                    console.log('websocket connected')
                },
                disconnected: () => {
                    console.log('websocket disconnected')                   
                },
                received: (data) => {
                    console.log(data)
                    this.writeResult(this.term, data['message'])
                }
            })
        },
        mounted: function() {
            this.term = new Terminal();
            this.term.open(document.getElementById('terminal'));
            this.openTerms(this.term);
        },
        methods: {
            openTerms: function(term) {
                let prompt = this.prompt
                let cursor = 0;
                let current_line = "";
                term.write(prompt)
                term.onKey((data) => {
                    console.log('Current Line : ' + current_line)
                    switch(data.domEvent.key) {
                        case "Enter":
                            // term.write('\r\n');
                            if (current_line) {
                                this.command(current_line)
                            } else {
                                term.write('\r\n');
                                term.write(prompt);
                            }
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
            },
            writeResult: function(term, result) {
                let prompt = this.prompt
                const results = result.split('\n');
                console.log(results);
                for (const result of results) {
                    term.write('\r\n');
                    term.write(result);
                }
                term.write('\r\n');
                term.write(prompt);
            },
            command: function(command) {
                this.terminalChannel.perform('terminal_operation', {
                    command: command
                })
            }
        },
    }
</script>