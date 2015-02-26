require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create post" do
    post = Post.create(titulo: "Mi titulo", contenido: "Mi contenido")
    assert post.save
  end

  test "Update Post" do
    post = posts(:primer_articulo)
    assert post.update(titulo: "Este es un cambio", contenido: "Cambio el contenido")
  end

  test "Find id Post" do
    post_id = posts(:primer_articulo).id
    post = Post.find(post_id)
    assert_nothing_raised {Post.find(post_id)}
  end

  test "Delete Post" do
    post = posts(:primer_articulo)
    post.destroy
    assert_raise(ActiveRecord::RecordNotFound) {Post.find(post.id)}
  end

  test "Not create Post untitled" do
    post = Post.new
    assert post.invalid?, "El post debe ser invalido"
  end

  test "cada titulo debe ser unico" do
    post = Post.new
    post.titulo = posts(:primer_articulo).titulo
    assert post.invalid? "Dos post no deben tener el mismo titulo"
  end
end
