
namespace PagueMenos.DataContracts.Product
{
    /// <summary>
    /// The Product data
    /// </summary>
    public class ProductDataContract
    {
        /// <summary>
        /// GTIN code of 13 digits (for US and Canada : 12 digits prexifed with 0)
        /// </summary>
        public string Code { get; set; }
        /// <summary>
        /// Commercial name of the product
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// The measure weight in Gramme. Measure concerns the internal unit , not the full pack.
        /// </summary>
        public float? Weight { get; set; }
        /// <summary>
        /// The measure volume in millilitres. Measure concerns the internal unit , not the full pack.
        /// </summary>
        public float? Volume { get; set; }
        /// <summary>
        /// Number of units in the product. Example: 6 bottles in a commercialized pack (to be able to display 6 x 330ml ).
        /// </summary>
        public int Unity { get; set; }
    }
}
