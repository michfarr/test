require 'rails_helper'

describe ProductsController do
  describe "GET #index" do
    let(:product) { Product.create(
                            name: "Thingy-ma-bob",
                            description: "Such a product",
                            price: 10
                            ) }

    before do
      get :index
    end

    it "assigns @products" do
      expect(assigns(:products)).to eq([product])
    end
    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    let(:product) { Product.create(
                          name: "Thingy-ma-bob",
                          description: "Such a product",
                          price: 10
                            ) }
    before do
      get :show, id: product.id
    end

    it "assigns @product" do
      expect(assigns(:product)).to eq(product)
    end
    it "renders the show template" do
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    before do
      get :new
    end

    it "assigns @product as a new product" do
      expect(assigns(:product)).to be_a_new(Product)
    end
    it "renders the new template" do
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    let(:product) { Product.create(
                        name: "Thingy-ma-bob",
                        description: "Such a product",
                        price: 10
                            ) }
    before do
      get :edit, id: product.id
    end

    it "assigns @product" do
      expect(assigns(:product)).to eq(product)
    end

    it "renders the edit template" do
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) {
        { product: { name: "Thingy-ma-bob", description: "Wow!" } }
      }

      it "creates a new product" do
        expect{
          post :create, valid_params
        }.to change(Product, :count).by(1)
      end

      it "assigns newly created product as @product" do
        post :create, valid_params
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the product show page" do
        post :create, valid_params
        expect(response).to redirect_to(Product.last)
      end
    end
    context "with invalid params" do
      let(:invalid_params) {
        { product: { name: "Thingy-ma-bob", description: nil } }
      }

      it "assigns newly created but unsaved product as @product" do
        post :create, invalid_params
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "rerenders the new template" do
        post :create, invalid_params
        expect(response).to render_template("new")
      end
    end
  end

  describe "POST #update" do
    context "with valid params" do
      let(:valid_params) {
        { product: { name: "Thingy-ma-bob", description: "Wow!" } }
      }

      
    end
    context "with invalid params" do
      let(:invalid_params) {
        { product: { name: "Thingy-ma-bob", description: nil } }
      }


    end
  end
end
