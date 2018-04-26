<template>
    <div class="configuration">
        <md-steppers>
            <md-step id="first" md-label="Build configuration">
                <md-card class="md-layout-item md-size-75 md-small-size-100 md-with-hover">
                    <md-card-header>
                        <div class="md-title">Build configuration:</div>
                    </md-card-header>
                    <md-card-content>
                        <div>
                            <p>
                                Mirror:
                            </p>
                            <md-autocomplete v-model="mirror" :md-options="mirrors" required>
                                <label>Mirror</label>
                            </md-autocomplete>
                        </div>
                        <div>
                            <p>
                                Distro:
                            </p>
                            <md-radio v-model="distro" value="jessie">jessie</md-radio>
                            <md-radio v-model="distro" value="stretch">stretch</md-radio>
                            <md-radio v-model="distro" value="testing">testing</md-radio>
                            <md-radio v-model="distro" value="sid">sid</md-radio>
                        </div>
                        <div>
                            <p>
                                Arquitecture:
                            </p>
                            <md-radio v-model="arquitecture" value="i386">i386</md-radio>
                            <md-radio v-model="arquitecture" value="amd64">amd64</md-radio>
                        </div>
                    </md-card-content>
                    <md-card-actions>
                        <md-button type="submit" class="md-primary">Save Configuration</md-button>
                    </md-card-actions>
                </md-card>
            </md-step>
            <md-step id="second" md-label="Imagen configuration">
                <md-card class="md-layout-item md-size-75 md-small-size-100 md-with-hover">
                    <md-card-header>
                        <div class="md-title">Imagen configuration:</div>
                    </md-card-header>
                    <md-card-content>
                        <md-field>
                            <label>Imagen options</label>
                            <md-textarea v-model="options" id="imagenOptions"></md-textarea>
                        </md-field>
                    </md-card-content>
                    <md-card-actions>
                        <md-button type="submit" class="md-primary">Save Configuration</md-button>
                    </md-card-actions>
                </md-card>
            </md-step>
        </md-steppers>
    </div>
</template>

<script>
    export default {
      name: 'Configuration',
      data () {
        return {
          mirror: null,
          distro: 'jessie',
          arquitecture: 'i386',
          mirrors: [
            'https://softlibre.unizar.es/debian',
            'ftp.es.debian.org/debian/',
            'ftp.de.debian.org/debian/'
          ],
          options: 'locales=es_ES.UTF-8\n' +
          'keyboard-layouts=es\n' +
          'username=live-user\n' +
          'live-config.login\n' +
          'live-config.user-default-groups=audio,cdrom,dip,floppy,video,plugdev,netdev,powerdev,scanner,bluetooth,fuse'
        }
      },
      methods: {
        navHome () {
          this.$router.push({name: 'home'})
        },
        save () {}
      }
    }
</script>

<style scoped>
    .md-layout-item{
        margin-left: auto;
        margin-right: auto;
    }
    #imagenOptions {
        height: 200px;
    }
</style>
