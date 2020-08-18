$(function() {

  function createChildrenHTML(data) {
    let html = `<div class="status_register__status_category_group__category__choose1">
                  <i class="fas fa-chevron-down status_register__status_category_group__category__choose--arrow-down"></i>`
    html += `<select class="select-box__category__child" id="category-child" name="item[category_child_id]"><option value="">---</option>`

    $.each(data, function(i, datum) {
      html += `<option value="${datum.id}">${datum.name}</option>`
    });

    html += `</select>`
    html += `</div>`;
    return html;
  }

  function createGrandchildrenHTML(data) {
    let html = `<div class="status_register__status_category_group__category__choose2">
                  <i class="fas fa-chevron-down status_register__status_category_group__category__choose--arrow-down"></i>`
    html += `<select class="select-box__category__grandchild" id="category-grandchild" name="item[category_id]"><option value="">---</option>`

    $.each(data, function(i, datum) {
      html += `<option value="${datum.id}">${datum.name}</option>`
    });

    html += `</select>`
    html += `</div>`;
    return html;
  }

  // change root_category event
  $("#category-root").on("change", function() {
    let category_root = $(this).val();
    $("#children_wrapper").empty();
    $("#grandchildren_wrapper").empty();
    if (category_root == ""){return false}

    $.ajax({
      type: 'GET',
      url: '/categories',
      data: { category_root: category_root },
      dataType: 'json'
    })
    .done(function(data) {
      let html = createChildrenHTML(data);
      $("#children_wrapper").append(html);
    })
    .fail(function() {
      alert('error');
    });
  });

  // change child_category event
  $("#children_wrapper").on("change", "#category-child", function() {
    let category_child = $("#category-child").val();
    $("#grandchildren_wrapper").empty();
    if (category_child == ""){return false}

    $.ajax({
      type: 'GET',
      url: '/categories',
      data: { category_child: category_child },
      dataType: 'json'
    })
    .done(function(data) {
      let html = createGrandchildrenHTML(data);
      $("#grandchildren_wrapper").append(html);
    })
    .fail(function() {
      alert('error');
    });
  });

});
