document.addEventListener("DOMContentLoaded", function() {
    var setUserMode = function(mode) {
        if (!window.localStorage) {
            return;
        }
        if (mode === 'os') {
            window.localStorage.removeItem('color-scheme');
        } else {
            try {
                window.localStorage.setItem('color-scheme', mode);
            } catch (e) {
                /* ignore */
            }
        }
    }
    var getUserMode = function() {
        if (!window.localStorage) {
            return 'os';
        }
        var userMode = window.localStorage.getItem('color-scheme');
        return userMode === null ? 'os' : userMode;
    }
    var getOsMode = function() {
        if (!window.matchMedia) {
            return 'light';
        }
        var osMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
        return osMode ? 'dark' : 'light';
    }
    var setupColorScheme = function() {
        var userMode = getUserMode();
        var mode = userMode !== 'os' ? userMode : getOsMode();
        document.documentElement.setAttribute('data-color-scheme', mode);
    }

    var button = document.querySelector('#color-scheme');
    if (button) {
        button.addEventListener('click', function() {
            var userMode = getUserMode();
            var osMode = getOsMode();
            if (osMode === 'dark' && userMode !== 'light') {
                setUserMode('light');
            } else if (osMode === 'light' && userMode !== 'dark') {
                setUserMode('dark');
            } else {
                setUserMode('os');
            }
            setupColorScheme();
        });
    }

    if (window.matchMedia) {
        window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', setupColorScheme);
    }
    setupColorScheme();
});
