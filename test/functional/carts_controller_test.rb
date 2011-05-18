require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Cart.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Cart.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Cart.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to cart_url(assigns(:cart))
  end
  
  def test_edit
    get :edit, :id => Cart.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Cart.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Cart.first
    assert_template 'edit'
  end

  def test_update_valid
    Cart.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Cart.first
    assert_redirected_to cart_url(assigns(:cart))
  end
  
  def test_destroy
    cart = Cart.first
    delete :destroy, :id => cart
    assert_redirected_to carts_url
    assert !Cart.exists?(cart.id)
  end
end
