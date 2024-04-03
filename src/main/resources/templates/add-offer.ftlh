<#import "blocks/template.ftlh" as t>
<@t.template user>
        <form action="/offer/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Название</label>
                <input type="text" required class="form-control"
                       id="name" name="name">
            </div>
            <div class="form-group">
                <label for="price">Цена</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="price" name="price">
                    <div class="input-group-append">
                        <span class="input-group-text">₽</span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="description">Описание</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <br>

            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">Первое фото</label>
                </div>
            </div>
            <br>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Второе фото</label>
                </div>
            </div>
            <br>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Третье фото</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
        </form>
</@t.template>
