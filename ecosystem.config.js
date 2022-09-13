module.exports = {
    apps: [{
        name: 'Fluxos',
        script: './init.js',
        exec_mode: 'cluster',
        instances: 1
    }
],
};