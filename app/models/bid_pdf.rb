require "render_anywhere"

class BidPdf
  include RenderAnywhere

  def initialize(bid)
    @bid = bid
  end

  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4', zoom: 4)
    kit.to_file("#{Rails.root}/public/bid.pdf")
  end

  def filename
    "Application #{bid.id}.pdf"
  end

  private

    attr_reader :bid

    def as_html
      render template: "admin/bids/pdf", layout: "bid_pdf", locals: { bid: bid }
    end
end
