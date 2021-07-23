(function() {

    const headerGnb = document.querySelector('.c_menu');
    const gnbList = document.querySelectorAll('.c_menu a');
    const target = document.querySelector('.c_menu_hover');

    function headerMouseEnterFunc() {
        target.style.opacity = '1';

        if (!this.classList.contains('active')) {
            gnbList.forEach(a => {
                if (a.parentNode.classList.contains('active')) {
                    a.parentNode.classList.remove('active');
                }
                a.style.opacity = '0.25';
            });

            this.parentNode.classList.add('active');
            this.style.opacity = '1';

            const width = this.getBoundingClientRect().width;
            const height = this.getBoundingClientRect().height;
            const left = this.getBoundingClientRect().left + window.pageXOffset;
            const top = this.getBoundingClientRect().top + window.pageYOffset + 20;
            const color = 'var(--iruri-red-color)';

            target.style.width = `${width}px`;
            target.style.height = `${height}px`;
            target.style.left = `${left}px`;
            target.style.top = `${top}px`;
            target.style.borderColor = color;
            target.style.transform = 'none';

        }
    }

    function headerResizeFunc() {
        const active = document.querySelector('gnb__item.active');

        if (active) {
            const left = active.getBoundingClientRect().left + window.pageXOffset;
            const top = active.getBoundingClientRect().top + window.pageYOffset;

            target.style.left = `${left}px`;
            target.style.top = `${top}px`;
        }
    }

    function init() {
        gnbList.forEach(a => {
            a.addEventListener('mouseenter', headerMouseEnterFunc);
        });
        window.addEventListener('resize', headerResizeFunc);
        headerGnb.addEventListener("mouseleave", () => {
            target.style.opacity = '0'
            gnbList.forEach(a => {
                a.style.opacity = '1';
            });
        });
    }
    init();
})();